require 'test_helper'

class TransaccionsControllerTest < ActionController::TestCase
  setup do
    @transaccion = transaccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaccion" do
    assert_difference('Transaccion.count') do
      post :create, transaccion: { authorization_code: @transaccion.authorization_code, client_id: @transaccion.client_id, detail: @transaccion.detail, gateway_id: @transaccion.gateway_id, order_id: @transaccion.order_id, pay_method: @transaccion.pay_method, paydate: @transaccion.paydate, payed: @transaccion.payed, status: @transaccion.status, total: @transaccion.total }
    end

    assert_redirected_to transaccion_path(assigns(:transaccion))
  end

  test "should show transaccion" do
    get :show, id: @transaccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaccion
    assert_response :success
  end

  test "should update transaccion" do
    patch :update, id: @transaccion, transaccion: { authorization_code: @transaccion.authorization_code, client_id: @transaccion.client_id, detail: @transaccion.detail, gateway_id: @transaccion.gateway_id, order_id: @transaccion.order_id, pay_method: @transaccion.pay_method, paydate: @transaccion.paydate, payed: @transaccion.payed, status: @transaccion.status, total: @transaccion.total }
    assert_redirected_to transaccion_path(assigns(:transaccion))
  end

  test "should destroy transaccion" do
    assert_difference('Transaccion.count', -1) do
      delete :destroy, id: @transaccion
    end

    assert_redirected_to transaccions_path
  end
end
