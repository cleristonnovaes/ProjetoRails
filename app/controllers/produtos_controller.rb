class ProdutosController < ApplicationController
    def index
        @produtosnome = Produto.order(:nome).limit 5
        @produtospreco = Produto.order(:preco).limit 2
    end

    def new
        @produto = Produto.new
    end

    def busca
        @nome_a_buscar = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end

    def create
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
        @produto = Produto.new valores
        if @produto.save
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
end
