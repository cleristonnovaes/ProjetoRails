class ProdutosController < ApplicationController
    def index
        @produtosnome = Produto.order(:nome).limit 5
        @produtospreco = Produto.order(:preco).limit 2
    end
end
