class Funcionario < ApplicationRecord
    validates :nome, presence: true
  end