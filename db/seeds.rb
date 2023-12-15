# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create!(email: 'apololira+admin@gmail.com', password: '1313sjm')

Icp.create(name:'Indústrias e Consultorias',status:"ativo")
Icp.create(name:'Startups, ICTs e Inovadores',status:"ativo")
Icp.create(name:'Empresas de Energia',status:"ativo")

Plano.create(name:'Free',status:"ativo")
Plano.create(name:'ICP 1 - Pago',status:"ativo")
Plano.create(name:'ICP 2 - Pago',status:"ativo")

Empresa.create(plano_id: 1, status: "ativo", razaosocial: "Empresa 1", nomefantasia: "Empresa 1")

User.create(name: "rgslirasuser1", phone: "767676766", email: "rgsliras+user1@gmail.com", cpf: nil, birthdate: nil, icp_id: 2, plano_id: 2, status: "ativo", newsletter: true, empresa_id: 1)
User.create(name: "rgslirasuser2", phone: "5454545454", email: "rgsliras+user2@gmail.com", cpf: nil, birthdate: nil, icp_id: 1, plano_id: 2, status: "ativo", newsletter: true, empresa_id: 1)
User.create(name: "rgslirasuser0", phone: "5454545", email: "rgsliras+user0@gmail.com", cpf: nil, birthdate: nil, icp_id: 3, plano_id: 2, status: "ativo", newsletter: true, empresa_id: 1)

