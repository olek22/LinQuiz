<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PoziomyEdit.aspx.cs" Inherits="LinQuiz.PoziomyEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Zarządzaj poziomami trudności</title>

    <%--    <script type="text/javascript" charset="utf-8">  
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Zarządzaj poziomami trudności</h1>

    <div class="row mt-4">
        <div class="col-sm">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:con %>" DeleteCommand="DELETE FROM [poziomtrudnosci] WHERE [id] = @original_id AND [nazwa] = @original_nazwa" InsertCommand="INSERT INTO [poziomtrudnosci] ([nazwa]) VALUES (@nazwa)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [poziomtrudnosci] ORDER BY [id]" UpdateCommand="UPDATE [poziomtrudnosci] SET [nazwa] = @nazwa WHERE [id] = @original_id AND [nazwa] = @original_nazwa">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_nazwa" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nazwa" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nazwa" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_nazwa" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView class="table table-hover table-borderless" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nazwa" HeaderText="Poziom trudności" SortExpression="nazwa" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="row mt-4">
        <asp:Label for="nazwaTextBox" ID="nazwaLabel" runat="server" Text="Podaj poziom trudności:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server" ControlToValidate="nazwaTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        <asp:TextBox class="form-control" ID="nazwaTextBox" runat="server"></asp:TextBox>

        <asp:Button ValidationGroup='valGroup1' class="btn btn-primary" ID="dodajButton" runat="server" Text="Dodaj poziom trudności" OnClick="dodajButton_Click" />
    </div>

    <div class="row mt-4">
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="AdminPanel.aspx"><i class="far fa-arrow-alt-circle-left"></i>&nbsp;Wróc do panelu administratora</a></div>
    </div>
</asp:Content>
