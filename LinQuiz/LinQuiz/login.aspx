<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LinQuiz.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <p></p>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <center>
                        <p>Logowanie</p>
                         </center>
                         <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Nazwa</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="user1 lub admin1"></asp:TextBox>
                        </div>
                        <label>Hasło</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="user1 lub admin1" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Zaloguj" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group">
                            <asp:Button class="btn btn-info btn-block btn-lg" ID="Button3" runat="server" Text="Załóż konto" OnClick="Button3_Click"/>
                       </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="nav-link" runat=server href="Default.aspx" style="COLOR: white"><i class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;Wróć do strony głównej</a>
            </div>
      </div>
   </div>
</asp:Content>
