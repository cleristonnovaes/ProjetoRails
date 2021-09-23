class ProdutosController < ApplicationController
    def index
        @produtosnome = Produto.order(:nome).limit 5
        @produtospreco = Produto.order(:preco).limit 2
    end

    def new
        @produto = Produto.new
        renderiza_new
    end

    def busca
        @nome_a_buscar = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end

    def edit
        set_produto
        renderiza_new
        
    end
   

    def update
        set_produto
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
        if @produto.update valores
            flash[:notice] = "Produto atualizado com sucesso"
            redirect_to root_url
        else
            renderiza_new
        end
    end


    def create
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
        @produto = Produto.new valores
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso"
            redirect_to root_url
        else
            renderiza_new
        end
    end

    def destroy
        set_produto
        @produto.destroy
        redirect_to root_url
    end

    private

    def renderiza_new
        @departamentos = Departamento.all 
        render :new
    end

    def set_produto
        id = params[:id]
        @produto = Produto.find(id)
    end

end
