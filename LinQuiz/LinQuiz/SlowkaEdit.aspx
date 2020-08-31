<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SlowkaEdit.aspx.cs" Inherits="LinQuiz.SlowkaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Zarządzaj słówkami</title>

    <%--    <script type="text/javascript" charset="utf-8">  
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Zarządzaj słówkami</h1>

    <div class="row mt-4">
        <div class="col-sm">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:con %>" DeleteCommand="DELETE FROM [slowko] WHERE [id] = @original_id AND [definicja_id] = @original_definicja_id AND [poziomtrudnosci_id] = @original_poziomtrudnosci_id AND [kategoria_id] = @original_kategoria_id AND [nazwa] = @original_nazwa" InsertCommand="INSERT INTO [slowko] ([definicja_id], [poziomtrudnosci_id], [kategoria_id], [nazwa]) VALUES (@definicja_id, @poziomtrudnosci_id, @kategoria_id, @nazwa)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [slowko] ORDER BY [id]" UpdateCommand="UPDATE [slowko] SET [definicja_id] = @definicja_id, [poziomtrudnosci_id] = @poziomtrudnosci_id, [kategoria_id] = @kategoria_id, [nazwa] = @nazwa WHERE [id] = @original_id AND [definicja_id] = @original_definicja_id AND [poziomtrudnosci_id] = @original_poziomtrudnosci_id AND [kategoria_id] = @original_kategoria_id AND [nazwa] = @original_nazwa">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_definicja_id" Type="Int32" />
                    <asp:Parameter Name="original_poziomtrudnosci_id" Type="Int32" />
                    <asp:Parameter Name="original_kategoria_id" Type="Int32" />
                    <asp:Parameter Name="original_nazwa" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="definicja_id" Type="Int32" />
                    <asp:Parameter Name="poziomtrudnosci_id" Type="Int32" />
                    <asp:Parameter Name="kategoria_id" Type="Int32" />
                    <asp:Parameter Name="nazwa" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="definicja_id" Type="Int32" />
                    <asp:Parameter Name="poziomtrudnosci_id" Type="Int32" />
                    <asp:Parameter Name="kategoria_id" Type="Int32" />
                    <asp:Parameter Name="nazwa" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_definicja_id" Type="Int32" />
                    <asp:Parameter Name="original_poziomtrudnosci_id" Type="Int32" />
                    <asp:Parameter Name="original_kategoria_id" Type="Int32" />
                    <asp:Parameter Name="original_nazwa" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView class="table table-hover table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="definicja_id" HeaderText="ID definicji" SortExpression="definicja_id" />
                    <asp:BoundField DataField="poziomtrudnosci_id" HeaderText="ID poziomu trudności" SortExpression="poziomtrudnosci_id" />
                    <asp:BoundField DataField="kategoria_id" HeaderText="ID kategorii" SortExpression="kategoria_id" />
                    <asp:BoundField DataField="nazwa" HeaderText="Słówko" SortExpression="nazwa" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="row mt-4">
        <asp:Label for="poziomTextBox" ID="poziomLabel" runat="server" Text="Podaj numer id poziomu trudności:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator1" runat="server" ControlToValidate="poziomTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ValidationGroup='valGroup1' ID="RegularExpressionValidator3" runat="server" ErrorMessage="Tylko liczby!" ControlToValidate="poziomTextBox" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <asp:TextBox class="form-control" ID="poziomTextBox" runat="server"></asp:TextBox>

        <asp:Label for="definicjaTextBox" ID="definicjaLabel" runat="server" Text="Podaj numer id definicji:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator4" runat="server" ControlToValidate="definicjaTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ValidationGroup='valGroup1' ID="RegularExpressionValidator1" runat="server" ErrorMessage="Tylko liczby!" ControlToValidate="definicjaTextBox" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <asp:TextBox class="form-control" ID="definicjaTextBox" runat="server"></asp:TextBox>

        <asp:Label for="kategoriaTextBox" ID="kategoriaLabel" runat="server" Text="Podaj numer id kategorii:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator5" runat="server" ControlToValidate="kategoriaTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ValidationGroup='valGroup1' ID="RegularExpressionValidator2" runat="server" ErrorMessage="Tylko liczby!" ControlToValidate="kategoriaTextBox" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <asp:TextBox class="form-control" ID="kategoriaTextBox" runat="server"></asp:TextBox>

        <asp:Label for="nazwaTextBox" ID="nazwaLabel" runat="server" Text="Podaj słówko:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server" ControlToValidate="nazwaTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        <asp:TextBox class="form-control" ID="nazwaTextBox" runat="server"></asp:TextBox>

        <asp:Button ValidationGroup='valGroup1' class="btn btn-primary" ID="dodajButton" runat="server" Text="Dodaj słówko" OnClick="dodajButton_Click" />
    </div>

    <div class="row mt-4">
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="SlowkaList.aspx">Wróc do listy słówek&nbsp;<i class="far fa-arrow-alt-circle-right"></i></a></div>
    </div>
</asp:Content>
