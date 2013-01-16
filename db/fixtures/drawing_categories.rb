DrawingCategory.seed(:id,
  {id: 1, name: 'Digital art'},
  {id: 2, name: 'Traditional art'},
  {id: 3, name: 'Anime & Manga'},
  {id: 6, name: 'Naruto', parent_id: 3},
  {id: 4, name: 'Self drawing', parent_id: 1},
  {id: 5, name: 'Animals', parent_id: 1},
)
#friendly_id
DrawingCategory.find_each(&:save)