require 'test_helper'

class PurchaseUploadsControllerTest < ActionController::TestCase
  setup do
    @purchase_upload = purchase_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_upload" do
    assert_difference('PurchaseUpload.count') do
      post :create, purchase_upload: { file: @purchase_upload.file }
    end

    assert_redirected_to purchase_upload_path(assigns(:purchase_upload))
  end

  test "should show purchase_upload" do
    get :show, id: @purchase_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_upload
    assert_response :success
  end

  test "should update purchase_upload" do
    patch :update, id: @purchase_upload, purchase_upload: { file: @purchase_upload.file }
    assert_redirected_to purchase_upload_path(assigns(:purchase_upload))
  end

  test "should destroy purchase_upload" do
    assert_difference('PurchaseUpload.count', -1) do
      delete :destroy, id: @purchase_upload
    end

    assert_redirected_to purchase_uploads_path
  end
end
