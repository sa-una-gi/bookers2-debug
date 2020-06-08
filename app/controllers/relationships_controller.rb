class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(
      user_id: current_user.id,
      follower_id: params[:user_id]
    )
    relationship.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    relationship = Relationship.find_by(
      user_id: current_user.id,
      follower_id: params[:user_id]
    )
    relationship.destroy
    redirect_back(fallback_location: root_path)
  end

  def follow
    user = User.find(params[:user_id])
    @users = Relationship.where(user_id: user.id)
  end

  def follower
    user = User.find(params[:user_id])
    @users = Relationship.where(follower_id: user.id)
  end
end
