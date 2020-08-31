<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DefinicjeEdit.aspx.cs" Inherits="LinQuiz.DefinicjeEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Zarządzaj definicjami</title>

    <%--    <script type="text/javascript" charset="utf-8">  
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Zarządzaj definicjami</h1>

    <div class="row mt-4">
        <div class="col-sm">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:con %>" DeleteCommand="DELETE FROM [definicja] WHERE [id] = @original_id AND [tlumaczenie] = @original_tlumaczenie" InsertCommand="INSERT INTO [definicja] ([tlumaczenie]) VALUES (@tlumaczenie)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [definicja] ORDER BY [id]" UpdateCommand="UPDATE [definicja] SET [tlumaczenie] = @tlumaczenie WHERE [id] = @original_id AND [tlumaczenie] = @original_tlumaczenie">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_tlumaczenie" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="tlumaczenie" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="tlumaczenie" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_tlumaczenie" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView class="table table-hover table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="tlumaczenie" HeaderText="Definicja" SortExpression="tlumaczenie" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="row mt-4">
        <asp:Label for="tlumTextBox" ID="tlumLabel" runat="server" Text="Podaj definicje:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server" ControlToValidate="tlumTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        <asp:TextBox class="form-control" ID="tlumTextBox" runat="server"></asp:TextBox>

        <asp:Button ValidationGroup='valGroup1' class="btn btn-primary" ID="dodajButton" runat="server" Text="Dodaj definicje" OnClick="dodajButton_Click" />
    </div>

    <div class="row mt-4">
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="AdminPanel.aspx"><i class="far fa-arrow-alt-circle-left"></i>&nbsp;Wróc do panelu administratora</a></div>
    </div>
</asp:Content>
