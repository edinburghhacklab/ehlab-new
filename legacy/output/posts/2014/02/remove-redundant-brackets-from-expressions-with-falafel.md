---
title: "Remove redundant brackets from expressions with Falafel"
date: 2014-02-03
---

I am writing a [static analyser](http://tomlarkworthy.github.io/) for [Firebase](https://www.firebase.com/). My approach to precedence and brackets has always been, if in doubt, whack a bracket round it. Unfortunately when writing code generation tools my output ends up with more brackets than logic :s

Anyway, I was having trouble debugging my generated code, and it was impossible to reason why it wasn't working what with all the brackets. So I kept with maximum bracket insertion in the 1st pass (a reliable strategy), but wrote a function for removing ALL redundant brackets from a Javascript expression post 1st pass (easier to read). It took a while to get right but I was very pleased with the brevity.

So the expression: (4 + 6) \* 6 needs its brackets to operated correctly, but (((4) + (7) \* 8) has a number of pointless brackets in it. There are some tricky cases like 5 / (7 \* 6), which requires brackets despite \* and / having equal precedence. To understand why 5 / (6 \* 7) needs brackets you have to understand that when operators have equal precedence, by default, they associate to the left. Anyway the code to actually do this turned out to be super compact so I share it with you!

I used node-falafel which is an awesome package that allows in place source code rewrites during a bottom up parse. Woah! The function "simplify" takes an expression as a string, and returns a functionally equivalent expression but without the pointless brackets in it. Nice!

<!--more-->

```
var falafel = require("falafel");

exports.simplify = function(javascript_str){
    var simplify_fn = function(node){
        node.precedence = 1000; //default precedence for all nodes other than operator nodes, e.g. terminals
        if(node.type == "BinaryExpression" || node.type == "BooleanExpression" || node.type == "LogicalExpression"){
            node.precedence = exports.js_precedence(node.operator); //overwrite with actual precedence
            if(node.left.precedence >= node.precedence){
                var LHS = node.left.source(); //LHS is already strongly bound
            }else if(node.left.precedence < node.precedence){
                var LHS = "("+node.left.source()+")"; //LHS is not strongly bound, boost with brackets
            }
            if(node.right.precedence > node.precedence){ //NOTE: > NOT >=
                var RHS = node.right.source(); //RHS is already strongly bound
            }else if(node.right.precedence <= node.precedence){
                var RHS = "("+node.right.source()+")"; //RHS is not strongly bound, boost with brackets
            }
            node.update(LHS + node.operator + RHS);
        }else if(node.type == "ExpressionStatement"){
            node.update(node.expression.source());
        }
    };
    return falafel(javascript_str, {}, simplify_fn).toString();
};

/**
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence
 * Precedence in retrieved from esprima source function "binaryPrecedence"
 */
exports.js_precedence =  function(token) {
    switch (token) {
        case '||':
            return 1;
        case '&&':
            return 2;
        case '|':
            return 3;
        case '^':
            return 4;
        case '&':
            return 5;
        case '==':
        case '!=':
        case '===':
        case '!==':
            return 6;
        case '<':
        case '>':
        case '<=':
        case '>=':
        case 'instanceof':
            return 7;
        case '<<':
        case '>>':
        case '>>>':
            return 8;
        case '+':
        case '-':
            return 9;
        case '*':
        case '/':
        case '%':
            return 11;
        default:
            return 0;
    }
};

```
