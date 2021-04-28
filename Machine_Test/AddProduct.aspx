<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style2
        {
            width: 256px;
        }
        .style3
        {
            width: 256px;
            height: 30px;
        }
        .style4
        {
            height: 30px;
        }
        .style5
        {
            width: 130px;
        }
        .style6
        {
            width: 130px;
            height: 30px;
        }
        .style7
        {
            width: 216px;
        }
        .style8
        {
            width: 216px;
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>ADD PRODUCT</h1>

        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="lblprodname" runat="server" Text="Product Name : "></asp:Label><br />
                    <asp:TextBox ID="TbprodName" runat="server" Width="223px"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="lblType" runat="server" Text="Type : "></asp:Label><br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="153px" AutoPostBack="true" 
                        onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="1" Text="Physical"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Virtual"></asp:ListItem>
                    
                    </asp:RadioButtonList>
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="RadioButtonList1" ErrorMessage=" Please select Type!!"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lbldesc" runat="server" Text="Description : "></asp:Label>
                    <br />
                    <asp:TextBox ID="Tbdesc" runat="server" Width="223px" TextMode="MultiLine"></asp:TextBox>
                    <br />
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style7">
                   <asp:Label ID="lblweight" runat="server" Text="Weight (In KG): "></asp:Label><br />
                  <asp:TextBox ID="Tbweight" runat="server" Width="223px"></asp:TextBox>
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                  <asp:Label ID="lblsku" runat="server" Text="SKU : "></asp:Label><br />
                  <asp:TextBox ID="Tbsku" runat="server" Width="223px"></asp:TextBox>
                  </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style7">
                   <asp:Label ID="lbllength" runat="server" Text="Length (In CM) : "></asp:Label><br />
                  <asp:TextBox ID="Tblenth" runat="server" Width="223px"></asp:TextBox>
                   </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                  <asp:Label ID="lblsprice" runat="server" Text="Selling Price : "></asp:Label><br />
                  <asp:TextBox ID="Tbsprice" runat="server" Width="223px"></asp:TextBox>
                  </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Tbsprice" ErrorMessage="*Please insert Selling Price!!" 
                        Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                  </td>
                <td class="style7">
                   <asp:Label ID="lblwidth" runat="server" Text="Width (In CM) : "></asp:Label><br />
                  <asp:TextBox ID="Tbwidth" runat="server" Width="223px"></asp:TextBox>
                   </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblqty" runat="server" Text="Avaliable Quantity : "></asp:Label><br />
                    <asp:TextBox ID="Tbqty" runat="server" Width="223px"></asp:TextBox>
                    </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style7">
                   <asp:Label ID="lblHeight" runat="server" Text="Height (In CM) : "></asp:Label><br />
                  <asp:TextBox ID="Tbheight" runat="server" Width="223px"></asp:TextBox>
                  </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                   <asp:Label ID="lblCat" runat="server" Text="Category : "></asp:Label><br />
                    <asp:DropDownList ID="DropDownList1" ClientIDMode="Static" runat="server" Height="22px" Width="230px">
                    </asp:DropDownList>
                    
                   </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Bold="True" ForeColor="#CC0000" 
                        ErrorMessage="*Please select category!!" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                    
                   </td>
                <td class="style7">
                    <asp:Label ID="lblImage" runat="server" Text="Image : "></asp:Label><br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Font-Bold="True" ForeColor="#CC0000" 
                        ControlToValidate="FileUpload1" ErrorMessage="*Please Select Image!!"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" Text="Add Product" Width="96px" 
                        onclick="Button1_Click" />
                    <br />
                   </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style8">
                    </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <h2>PRODUCT DETAILS :</h2>
  <%--      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >--%>
  <asp:Label ID="lblResult" runat="server"/>
        <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" AllowPaging="True"  
        OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="ID" CellPadding="4"  
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                OnRowDeleting="GridView1_RowDeleting" HeaderStyle-BackColor="Tomato">  

        <Columns>


        <asp:TemplateField HeaderText="Sr.No" HeaderStyle-Width="50px">  
        <ItemTemplate>  
        <asp:Label ID="Label1" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>  
        </ItemTemplate>  
        </asp:TemplateField>  

        <asp:TemplateField HeaderText="Image" HeaderStyle-Width="100px">  
        <ItemTemplate>  
        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagepath") %>' Height="100px" Width="100px" />  
        </ItemTemplate>  
        <EditItemTemplate>  
        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Imagepath") %>' Height="100px" Width="100px" />  
        <br />  
        <asp:FileUpload ID="FileUpload2" runat="server" />  
        </EditItemTemplate>  
        </asp:TemplateField> 

        <asp:TemplateField HeaderText="SKU" HeaderStyle-Width="80px">
        <EditItemTemplate>
        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("SKU") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Label ID="Label3" runat="server" Text='<%# Eval("SKU") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Product Name" HeaderStyle-Width="100px">
        <EditItemTemplate>
        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Left" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description" HeaderStyle-Width="500px">
        <EditItemTemplate>
        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("description") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Label ID="Label5" runat="server" Text='<%# Eval("description") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Left" />
        </asp:TemplateField>    

        <asp:TemplateField HeaderStyle-Width="100px" HeaderText="Actions">  
        <ItemTemplate>  
        <asp:LinkButton ID="LinkbuttonEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>  
        <asp:LinkButton ID="LinkbuttonDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>  
        </ItemTemplate>  
        <EditItemTemplate>  
        <asp:LinkButton ID="LinkbuttonUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>  
        <asp:LinkButton ID="LinkbuttonCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>  
        </EditItemTemplate>  
        </asp:TemplateField> 

        </Columns>
        </asp:GridView>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Sneha_TestConnectionString %>" 
            SelectCommand="SELECT [Name], [description], [SKU], [ImagePath] FROM [Products]">
        </asp:SqlDataSource>
    </div>--%>
    </form>
</body>
</html>
