# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
Subcategory.delete_all

f = Category.create(:name => 'Alimentação')
f.subcategories.create(:name => "Restaurantes" )
f.subcategories.create(:name => "Pizzarias" )
f.subcategories.create(:name => "Bares" )
f.subcategories.create(:name => "Lanchonetes" )
f.subcategories.create(:name => "Fast Food" )
f.subcategories.create(:name => "Tendas & Quiosques" )

g = Category.create(:name => 'Hospedagem')
g.subcategories.create(:name => "Hoteis" )
g.subcategories.create(:name => "Pousadas" )
g.subcategories.create(:name => "Casas" )
g.subcategories.create(:name => "Albergues" )
g.subcategories.create(:name => "Resorts" )

t = Category.create(:name => 'Diversão')
t.subcategories.create(:name => "Cinemas" )
t.subcategories.create(:name => "Shoppings" )
t.subcategories.create(:name => "Clubes & Boates" )
t.subcategories.create(:name => "Balneários" )
t.subcategories.create(:name => "Bares & Pub's" )
t.subcategories.create(:name => "Museus & Teatros" )
t.subcategories.create(:name => "Cassinos" )
t.subcategories.create(:name => "Estádios & Autódromos" )
t.subcategories.create(:name => "Moteis" )

y = Category.create(:name => 'Produtos')
y.subcategories.create(:name => "Áudio, Vídeo & Eletrônicos" )
y.subcategories.create(:name => "Saúde & Beleza" )
y.subcategories.create(:name => "Automotivos" )
y.subcategories.create(:name => "Roupas, Calçados & Acessórios" )
y.subcategories.create(:name => "Brinquedos & Hobbies" )
y.subcategories.create(:name => "Artigos Esportivos" )
y.subcategories.create(:name => "Conforto, Arte & Decoração" )
y.subcategories.create(:name => "Cama, Mesa & Banho" )
y.subcategories.create(:name => "Mercado, Feira & Variedades" )
y.subcategories.create(:name => "Livraria & Papelaria" )
y.subcategories.create(:name => "Ferramentas, Equipamentos & Utensílios" )
y.subcategories.create(:name => "Materiais de Construção" )
y.subcategories.create(:name => "Animais" )
y.subcategories.create(:name => "Indústrias & Agropecuária" )

u = Category.create(:name => 'Serviços')
u.subcategories.create(:name => "Serviços Gerais" )
u.subcategories.create(:name => "Automotivos" )
u.subcategories.create(:name => "Jurídicos" )
u.subcategories.create(:name => "Saúde & Beleza" )
u.subcategories.create(:name => "Aeroportos" )
u.subcategories.create(:name => "Rodoviárias" )
u.subcategories.create(:name => "Táxi & Frete" )
u.subcategories.create(:name => "Aluguel de Imóveis" )
u.subcategories.create(:name => "Aluguel de Veículos" )
u.subcategories.create(:name => "Assistências Técnicas" )
u.subcategories.create(:name => "Diversos" )
