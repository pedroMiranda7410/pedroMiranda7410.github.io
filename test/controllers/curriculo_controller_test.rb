require 'test_helper'

class CurriculoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get curriculo_index_url
    assert_response :success
  end

  test "should get contato" do
    get curriculo_contato_url
    assert_response :success
  end

  test "should get portifolio" do
    get curriculo_portifolio_url
    assert_response :success
  end

end
