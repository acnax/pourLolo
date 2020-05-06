class GossipsController < ApplicationController


	def index
		@first_name = params[:first_name]
		@gossip = Gossip.last(10).reverse
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def new
		@gossip = Gossip.new
	end

	def create
		@gossip = Gossip.new('title' => params[:title],
													'content' => params[:content],
													'user_id' => 11) # avec xxx qui sont les données obtenues à partir du formulaire

  	if @gossip.save # essaie de sauvegarder en base @gossip

    	redirect_to gossips_path, success: 'Gossip valide !' # si ça marche, il redirige vers la page d'index du site
  	else
    	render 'new' # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  end
	end

end
