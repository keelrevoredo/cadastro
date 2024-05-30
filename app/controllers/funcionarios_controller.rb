class FuncionariosController < ApplicationController
    def create
      # Cria um novo contato com os dados retornados por contato_params.
      @funcionario = Funcionario.new(funcionario_params)
      
      # Salva o contato no banco de dados. A função save retorna um booleano indicando se
      # o salvamento foi feito com sucesso ou não.
      if @funcionario.save
        # Caso o salvamento tenha sido feito com sucesso, responde com o JSON do contato e status 201 (Created)
        render json: @funcionario, status: :created
      else
        # Caso o salvamento falhe, responde com um JSON com erros e o status 422 (Unprocessable entity)
        render json: @funcionario.errors, status: :unprocessable_entity
      end
    end
    
    private
  
      def funcionario_params
        params.require(:funcionario).permit(:nome, :cpf, :email)
      end
    end
def show
    # Busca no banco de dados um contato com um ID específico
    @funcionario = Funcionario.find(params[:id])
    # Responde com o JSON do contato
    render json: @funcionario
end
def index
    # Busca no banco de dados todos os contatos existentes
    @funcionarios = Funcionario.all
    # Responde com o JSON de todos os contatos
    render json: @funcionarios
end
def update
    # Busca no banco de dados um contato com um ID específico
    @funcionario = Funcionario.find(params[:id])
    
    # Atualiza o contato no banco de dados. A função update retorna um booleano
    # indicando se a atualização foi realizada com sucesso.
    if @funcionario.update(funcionario_params)
      # Caso o contato tenha sido atualizado, responde a requisição com seu JSON e status 200 (Ok)
      render json: @funcionario
    else
      # Caso contrário, responde a requisição com erros em JSON e status 422 (Unprocessable entity)
      render json: @funcionario.errors, status: :unprocessable_entity
    end
end
def destroy
    # Busca no banco de dados um contato com um ID específico
    @funcionario = Funcionario.find(params[:id])
    # Apaga o contato do banco de dados
    @funcionario.destroy!
end