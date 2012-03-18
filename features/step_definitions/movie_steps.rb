# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
     Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  pos1 = page.body.index(e1)
  pos2 = page.body.index(e2)
  if (pos1 != nil and pos2 != nil)
    assert page.body.index(e1) < page.body.index(e2)
  else
    assert false
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/,\s*/).each do |mv|
    if (uncheck == nil)
      When %Q{I check "ratings_#{mv}"}
    else
      When %Q{I uncheck "ratings_#{mv}"}
    end
  end
end

Then /I should see all of the movies/ do
  assert Movie.all.count == (page.all('#movies tr').count - 1)
end
