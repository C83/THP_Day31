require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	test "should get new" do
	    get new_user_session_path
	    assert_response :success
	end

    #Il faut tester la page de login, qui doit login la personne si elle rentre un bon ID, et lui renvoyer un message d'erreur si elle ne renvoie pas un bon paramètre
    test "valid login information" do
    	get new_user_session_path
        post user_session_path, params: { user: { email: "user@example.com", password: "password"}}
    	assert_response :success
  	end

    test "invalid login information" do
    	get new_user_session_path
    	post user_session_path, params: { user: { email: "user@example.com", password: "bad_password"}}
    	assert_select 'div', 'Invalid Email or password''s'
  	end

    # Il faut tester la page du club, qui ne doit être accessible qu'aux personnes login. La page doit renvoyer la liste des personnes inscrites au site, donc il faut tester cela.
  	test "authenticated users can view the club members" do 
    	sign_in users(:one)
    	get club_path
    	assert_response :success
    end

    test "authenticated users can't view the club members" do 
    	get club_path
    	assert_response :redirect
    end

    # TDD 
    # Le lien de show doit être accessible de la navbar pour toute personne qui est login (il faut tester ceci). 
    test "show link should be in navbar when user is connected" do
        sign_in users(:one)
        get club_path
        assert_select 'a', 'Profile' 
    end

    # La page de show doit afficher les informations de l'utilisateur (il faut tester ceci).
    test "show page should display right informations about the user" do
        sign_in users(:one)
        get show_path(1)
        assert_select 'p', 'Your first name : first_name1'
    end

    # Enfin, la page de show ne doit être accessible qu'aux personnes login, et aux personnes concernées. 
    # Si une personne non login essaie d'aller sur une page show, le site va la rediriger vers la page de login en lui disant de se login pour aller à ce contenu (il faut tester ceci). 
    test "show page should redirect to login for disconnected user" do
        get show_path(:one)
        assert_redirected_to new_user_session_path
    end

    # Aussi, si une personne login essaie d'aller sur un profil autre que le sien, le site va la rediriger vers la page d'accueil en lui disant que l'accés est restreint (il faut tester ceci aussi).
    test "show page should redirect to home page for other user" do
        sign_in users(:one)
        get show_path(:two)
        assert_redirected_to root_path
    end

end
