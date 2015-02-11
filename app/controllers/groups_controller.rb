class GroupsController < ApplicationController
  protect_from_forgery with: :exception
  def index
  	@groups = Group.all
  end

  def show
  	@group = Group.find(params[:id])
  	@group_users = GroupUser.where(:group_id => @group.id)

  	@group_user = @group.group_user
  end

   def new
    @group = Group.new
  end

   def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_group
      @group = group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end
end
