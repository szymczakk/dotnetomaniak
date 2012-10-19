﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BaseViewData>" %>
<% bool isAuthenticated = Model.IsCurrentUserAuthenticated; %>
<div id="membershipBox" class="modalBox">
    <div class="titleContainer">
        <div class="title">
            <%--<% Model.SiteTitle%>--%></div>
        <div id="membershipClose" class="closeButton" title="Close">
        </div>
    </div>
    <div class="contentContainer">
        <%if (!isAuthenticated) %>
        <%{ %>
        <div id="loginSection">
            <div class="box">
                <h5>
                    Logowanie</h5>
                <p>
                    Zewnętrzni dostawcy tożsamości korzystają z technologii OpenID, dzięki której Twoje
                    hasło zawsze jest poufne i nie musisz zapamiętywać kolejnego.
                </p>
                <form id="frmOpenIdLogin" action="<%= Url.Action("OpenId", "Membership") %>" method="post">
                <fieldset>
                    <div class="add-article-row">
                        <label for="openid_identifier" class="label" id="openId">
                            Wprowadź URL swojego OpenID:</label>
                        <input id="openid_identifier" name="identifier" type="text" class="openIDTextBox" />
                        <span class="error"></span>
                    </div>
                    <div class="add-row2">
                        <input id="openid_RememberMe" name="rememberMe" type="checkbox" value="true" />Zapamiętaj
                        mnie na tym komputerze
                    </div>
                    <div class="add-article-row">
                        <input id="btnOpenId" type="submit" class="button" value="Login" />
                    </div>
                </fieldset>
                </form>
            </div>           
            <h6>
                lub...</h6>
            <p>
                Wprowadź nazwę użytkownika oraz hasło</p>
            <div class="box">
                <form id="frmLogin" action="<%= Url.Action("Login", "Membership") %>" method="post">
                <fieldset>
                    <div class="add-article-row">
                        <label for="txtLoginUserName" class="label">
                            Nazwa użytkownika:</label>
                        <input id="txtLoginUserName" name="userName" type="text" class="textBox" />
                        <span class="error"></span>
                    </div>
                    <div class="add-article-row">
                        <label for="txtLoginPassword" class="label">
                            Hasło:</label>
                        <input id="txtLoginPassword" name="password" type="password" class="textBox" />
                        <span class="error"></span>
                    </div>
                    <div class="add-row2">
                        <label class="label">
                        </label>
                        <input id="chkLoginRememberMe" name="rememberMe" type="checkbox" value="true" />Zapamiętaj
                        mnie na tym komputerze
                    </div>
                    <div class="add-article-row">
                        <span id="loginMessage" class="message"></span>
                    </div>
                    <div class="add-article-row">
                        <input id="btnLogin" type="submit" class="button" value="Login" />
                        <a href="#" id="lostPassword" name="lostPassword">zapomniałeś hasła?</a>
                    </div>
                </fieldset>
                </form>
            </div>    
        </div> 
        <%}%>
        <%if ((isAuthenticated) && (!Model.CurrentUser.IsOpenIDAccount())) %>
        <%{%>
        <div id="changePasswordSection">
            <div class="box">
                <h5>Zmień hasło</h5>                
                <form id="frmChangePassword" action="<%= Url.Action("ChangePassword", "Membership") %>"
                method="post">
                <fieldset>
                <div class="add-article-row">
                    <label for="txtChangeOldPassword" class="label">
                        Stare:</label>
                    <input id="txtChangeOldPassword" name="oldPassword" type="password" class="textBox" />
                    <span class="error"></span>
                </div>
                <div class="add-article-row">
                    <label for="txtChangeNewPassword" class="label">
                        Nowe:</label>
                    <input id="txtChangeNewPassword" name="newPassword" type="password" class="textBox" />
                    <span class="error"></span>
                </div>
                <div class="add-article-row">
                    <label for="txtChangenConfirmPassword" class="label">
                        Potwierdź:</label>
                    <input id="txtChangenConfirmPassword" name="confirmPassword" type="password" class="textBox" />
                    <span class="error"></span>
                </div>
                <div class="add-article-row">
                    <span id="changePasswordMessage" class="message"></span>
                </div>
                <div class="add-article-row">
                    <input id="btnChangePassword" type="submit" class="button" value="Change Password" />
                </div>
                </fieldset>
                </form>
            </div>
        </div>        
        <%}%>
        <%if (!isAuthenticated) %>
        <%{%>
        <div id="signupSection">
            <div class="box">
                <h5>
                    Załóż konto</h5>
                <p>
                    Podaj nazwę użytkownika i adres e-mail, aby założyć konto. Dzięki niemu będziesz
                    na bierząco informowany o zmianach w serwisie.</p>
                <form id="frmSignup" action="<%= Url.Action("Signup", "Membership") %>" method="post">
                <fieldset>
                    <div class="add-article-row">
                        <label for="txtSignupUserName" class="label">
                            Nazwa użytkownika:</label>
                        <input id="txtSignupUserName" name="userName" type="text" class="textBox" />
                        <span class="error"></span>
                    </div>
                    <div class="add-article-row">
                        <label for="txtSignupPassword" class="label">
                            Hasło:</label>
                        <input id="txtSignupPassword" name="password" type="password" class="textBox" />
                        <span class="error"></span>
                    </div>
                    <div class="add-article-row">
                        <label for="txtSignupEmail" class="label">
                            Email:</label>
                        <input id="txtSignupEmail" name="email" type="text" class="textBox" />
                        <span class="error"></span><span class="info">(Proszę wprowadź poprawny adres e-mail,
                            będzie potrzebny do weryfikacji)</span>
                    </div>
                    <div class="add-article-row">
                        <span id="signupMessage" class="message"></span>
                    </div>
                    <div class="add-article-row">
                        <input id="btnSignup" type="submit" class="button" value="Sign up" />
                    </div>
                </fieldset>
                </form>
            </div>
        </div>
        <div id="lostPasswordSection">
            <div class="box">
                <h5>Zapomniałeś hasła</h5>
                <form id="frmForgotPassword" action="<%= Url.Action("ForgotPassword", "Membership") %>" method="post">
                <fieldset>
                    <div class="add-article-row">
                        <label for="txtForgotEmail" class="label">
                            Email:</label>
                        <input id="txtForgotEmail" name="email" type="text" class="textBox" />
                        <span class="error"></span><span class="info">(działa tylko dla zarejestrowanych)</span>
                    </div>
                    <div class="add-article-row">
                        <span id="forgotPasswordMessage" class="message"></span>
                    </div>
                    <div class="add-article-row">
                        <input id="btnForgotPassword" type="submit" class="button" value="Wyślij hasło" />
                    </div>
                </fieldset>
                </form>
            </div>            
        </div> 
        <%}%>
    </div>
</div>