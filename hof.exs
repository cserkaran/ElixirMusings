in_p_tags = &(“<p>” <> &1 <> “</p>”)
in_nav_tags = &(“<nav>” <> &1 <> “</nav>”)
in_body_tags = &(“<body>” <> &1 <> “</body>”)
wrap = fn(wrapping_functions) ->
 fn(html) ->
   reducer = fn(function, acc) -> function.(acc) end
   Enum.reduce(wrapping_functions, html, reducer)
 end
end
wrap.([in_p_tags, in_body_tags]).(“Text”)