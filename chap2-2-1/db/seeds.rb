# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

code1 = 'A001'
if Account.find_by_code(code1).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code1,  
    name:'資産',
    parent_code: ''
    )
end

code2 = 'A010'
if Account.find_by_code(code2).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code2,  
    name:'流動資産',
    parent_code: code1
    )
end

code3 = 'A100'
if Account.find_by_code(code3).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code3,  
    name:'現金及び預金',
    parent_code: code2
    )
end

code3_1 = 'A101'
if Account.find_by_code(code3_1).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code3_1,  
    name:'現金',
    parent_code: code3
    )
end

code3_1 = 'A102'
if Account.find_by_code(code3_1).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code3_1,  
    name:'当座預金',
    parent_code: code3
    )
end

code3_1 = 'A103'
if Account.find_by_code(code3_1).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code3_1,  
    name:'普通預金',
    parent_code: code3
    )
end

code3_1 = 'A104'
if Account.find_by_code(code3_1).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code3_1,  
    name:'定期預金',
    parent_code: code3
    )
end

code4 = 'A200'
if Account.find_by_code(code4).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code4,  
    name:'売掛金',
    parent_code: code2
    )
end

code4_1 = 'A201'
if Account.find_by_code(code4_1).nil?
  Account.create(
    bs_pl_division:'BS',
    debit_credit_division:'借方',
    code: code4_1,  
    name:'売掛金',
    parent_code: code4
    )
end
