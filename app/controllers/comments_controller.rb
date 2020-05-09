class CommentsController < ApplicationController

	def create
		@comment = Comment.new('content' => params[:comment][:content],
													'user_id' => current_user.id,
													'gossip_id' => params[:gossip_id]) 

  	@comment.save 
    redirect_to gossip_path(@comment.gossip.id)
		
	end

	def edit
		@gossip = Gossip.find(params[:gossip_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		comment_params = params.require(:comment).permit(:content)
		if @comment.update(comment_params)
			redirect_to gossip_path(@comment.gossip.id), success: 'Commentaire modifié'		
		end

	end

	def destroy		
		@comment = Comment.find(params[:id])		
		if @comment.destroy
			redirect_to gossip_path(params[:gossip_id]), success: "Suppression reussite"
		end
	end

end
