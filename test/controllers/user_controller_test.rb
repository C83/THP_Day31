require 'test_helper'
require 'pry'

class UserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Ensuite tu vas tester la page d'inscription, qui doit évidemment retourner une erreur si la personne n'a pas rentré les bons champs (email en double, paramètre manquant)

  test "valid signup information" do
    assert_difference 'User.count', 1 do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									 last_name: "last_name_exemple",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    assert_redirected_to root_path
  end

  test "invalid signup form because no email" do
    assert_no_difference 'User.count' do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									 last_name: "last_name_exemple",
                                         email: "",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end 
  end

  test "invalid signup form because two emails" do
    assert_no_difference 'User.count' do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									 last_name: "last_name_exemple",
                                         email: "user@example.comuser@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end 
  end

  test "invalid signup form because miss a parameter" do
    assert_no_difference 'User.count' do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									 last_name: "",
                                         email: "user@example.comuser@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end 
  end

  # TDD
  # À partir de la page de profil (show), un utilisateur peut modifier son profil.
  test "should display a link to edit page" do
    sign_in users(:one)
    get show_path(1)
    assert_select 'a', 'Edit'
  end

  # La page d'edit affichera un formulaire similaire à celui du signup, qui va lui demander de changer Prénom, Nom, Email. 
  # Le formulaire est prepopulated par les attributs déjà existants. 
  # Évidemment, le formulaire doit renvoyer une erreur si un personne ne passe pas les bons paramètres (vide, email identique, etc)
  test "invalid update user form because miss a parameter" do
    sign_in users(:one)
    put user_registration_path, params: { user: { first_name: "first_name_exemple", 
                                        last_name: "",
                                         email: "user@example.comuser@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    assert_response :error

  end

  # Enfin, comme pour la méthode show, si une personne non login essaie d'aller sur une page edit, le site va la rediriger vers la passwordge de login en lui disant de se login pour aller à ce contenu (il faut tester ceci). 
  test "edit page should redirect to login for disconnected user" do
        get edit_user_registration_path(:one)
        assert_redirected_to new_user_session_path
    end

  # Aussi, si une personne login essaie de modifier un profil autre que le sien, le site va la rediriger vers la page d'accueil en lui disant que l'accés est restreint (il faut tester ceci aussi).
  test "edit page should redirect to home page for other user" do
      sign_in users(:one)
      get edit_user_registration_path(:two)
      assert_redirected_to root_path
  end
end
