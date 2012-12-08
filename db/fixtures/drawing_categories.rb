DrawingCategory.seed(:id,
  {:name => "Digital art"},
  {:name => "Traditional art"},
  {:name => "Anime & Manga"},
)
#friendly_id
DrawingCategory.find_each(&:save)