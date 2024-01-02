# app/views/cms_languages/index.json.jbuilder
json.languages @languages do |language|
  json.language_name language.languagename
end
