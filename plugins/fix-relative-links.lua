elements = HTML.select(page, "img")

local index = 1
while elements[index] do
  elem = elements[index]

  -- href = HTML.get_attribute(elem, "href")
  -- if String.starts_with(href, "./") then
  --   HTML.set_attribute(elem, "href", "." .. href)
  -- end
  src = HTML.get_attribute(elem, "src")
  if String.starts_with(src, "./") then
    HTML.set_attribute(elem, "src", "." .. src)
  end

  index = index + 1
end
