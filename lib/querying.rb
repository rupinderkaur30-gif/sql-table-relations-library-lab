def select_books_titles_and_years_in_first_series_order_by_year 
  "SELECT books.title, books.year FROM books ORDER BY books.year LIMIT 3;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name , characters.motto FROM characters ORDER BY length(motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species,COUNT(*)
  FROM characters
  GROUP BY(characters.species)
  ORDER BY (COUNT(characters.species))
   DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors 
  "SELECT authors.name , subgenres.name
  FROM subgenres
  INNER JOIN series
  ON subgenres.id = series.subgenre_id
  INNER JOIN authors
  ON authors.id = series.author_id
  GROUP BY authors.name;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title 
  FROM series
  INNER JOIN books
  ON books.series_id = series.id
  INNER JOIN character_books
  ON character_books.book_id = books.id
  INNER JOIN characters
  ON character_books.character_id = characters.id
  WHERE species = 'human'
  GROUP BY 'series.title'
  ORDER BY series.title DESC LIMIT 1;"

end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name , COUNT(name)
  FROM character_books
  INNER JOIN characters
  ON character_books.character_id = characters.id
  GROUP BY characters.name 
  ORDER BY COUNT(name) DESC , characters.name ASC;"
end
