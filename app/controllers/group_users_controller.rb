class GroupUsersController < ApplicationController
  protect_from_forgery with: :exception
  def index
  	@groups_users = GroupUser.all
  end

  def show
  	@group_user = GroupUser.find(params[:id])
  end

   def new
    @group_user = GroupUser.new
  end

   def create
    @group_user = GroupUser.new(group_user_params)

    respond_to do |format|
      if @group_user.save
        format.html { redirect_to root_path, notice: 'group_user was successfully created.' }
        format.json { render :show, status: :created, location: @group_user }
      else
        format.html { render :new }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @group_user.update(group_user_params)
        format.html { redirect_to @group_user, notice: 'group_user was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_user }
      else
        format.html { render :edit }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group_user.destroy
    respond_to do |format|
      format.html { redirect_to group_users_url, notice: 'group_user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_user
      @group_user = group_user.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_user_params
      params.require(:group_user).permit(:name, :user_id, :group_id)
    end
end
