<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StartQuiz.aspx.cs" Inherits="LinQuiz.StartQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Start</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" CssClass="cont">
        <div class="card" CssClass="card">
            <div class="row">
                <div class="col" align="left">
                    <h2>
                        Wybierz kategorie:
                    </h2>
                </div>
                <div class="col">
                    <center>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [nazwa] FROM [kategoria]"></asp:SqlDataSource>
                        <asp:DropDownList ID="kategoriaDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="nazwa" DataValueField="nazwa" Width="200px" BackColor="#3d5a80" ForeColor="#ffffff" Font-Names="Andalus" CssClass="ddl">
                        </asp:DropDownList>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col" align="left">
                    <h2>
                        Wybierz poziom trudności:
                    </h2>
                </div>
                <div class="col">
                    <center>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [nazwa] FROM [poziomtrudnosci]"></asp:SqlDataSource>
                        <asp:DropDownList ID="poziomDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="nazwa" DataValueField="nazwa" Width="200px" BackColor="#3d5a80" ForeColor="#ffffff" Font-Names="Andalus" CssClass="ddl">
                        </asp:DropDownList>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col">
                 
                </div>
                <div class="col">
                    <center>
                        <asp:Button class="btn btn-info btn-block btn-lg" ID="Button1" runat="server" OnClick="sendButton_Click" Text="Rozpocznij Quiz" />            
                    </center>
                </div>
                <div class="col">
                    
                </div>
            </div>
        
        </div>
    </div>


    <style type="text/css">
       .card{
            padding: 30px;
        }

        .ddl
        {
            border:2px solid #ffffff;
            border-radius:5px;
            padding:3px;
            -webkit-appearance: none; 
            background-image:url('Images/Arrowhead-Down-01.png');
            background-position:88px;
            background-repeat:no-repeat;
            text-indent: 0.01px;/*In Firefox*/
            text-overflow: '';/*In Firefox*/
        }
    </style>

</asp:Content>





