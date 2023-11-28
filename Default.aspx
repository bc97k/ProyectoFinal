<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoFinal.Default" %>

<!DOCTYPE html>
<script runat="server">

    protected void btnEnter_Click(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
    <script src="css/StyleSheet1.css" ></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <%--<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>--%>
<script type="text/javascript" src="scripts/jquery.mask.js"></script>
 <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>--%>
        <script type="text/javascript">
            //$("#<%= txtCadena.ClientID%>").mask("9999-9999-9999-9999");
            function hidecopy() {
                var tbxIdValue = document.getElementById('<%= txtCadena.ClientID %>').value;
                var value = document.getElementById('<%= txtCadena.ClientID %>').value.length;
                //document.getElementById('<%= txtCadena.ClientID %>').value = '*';
                var caracter = document.getElementById('<%= txtCadena.ClientID %>').value.substr(value - 1);
               
                //alert(tbxIdValue);
                if (value < 13) {
                    if (caracter.toString() == '*') {
                        document.getElementById('<%= CreditCard.ClientID %>').value = document.getElementById('<%= CreditCard.ClientID %>').value.substring(0, document.getElementById('<%= CreditCard.ClientID %>').value.length - 1);
                    }
                    else {
                        document.getElementById('<%= CreditCard.ClientID %>').value += caracter;
                    }
                    document.getElementById('<%= txtCadena.ClientID %>').value = '';
                    var hidencamp = document.getElementById('<%= CreditCard.ClientID %>').value;
                    //alert(hidencamp);
                    for (i = 0; i < value;i++) {
                        document.getElementById('<%= txtCadena.ClientID %>').value += '*';
                    }
                }
                
            }
        </script>
<head runat="server">
     <link rel="stylesheet" href="css/StyleSheet1.css">
     <title>Entregable 2</title>
</head>
<body>
    <form id="form1" runat="server">
            <h1>Entregable 2</h1>
            <asp:HiddenField runat="server" ID="CreditCard" />
            <asp:TextBox ID="txtCadena"  ClientIDMode="static" runat="server" MaxLength="16" onkeyup="hidecopy(); return true;" >
            </asp:TextBox>
            <asp:Button runat="server" ID="btnEnter" Text="Evaluar" OnClick="btnEnter_Click"/>
        <br />
        <div>
            <p>Número de tarjeta:</p><asp:Label runat="server" ID="lblNormal"></asp:Label><br />
        </div>
        <div>
            <p>Resultado (Se aplicó algoritmo SHA256) </p><asp:Label runat="server" ID="lblSHA"></asp:Label><br />
        </div>
        <div>
          <p>Resultado 2 (Se aplicó algoritno AES256)</p><asp:Label runat="server" ID="lblAES"></asp:Label><br />
        </div><br />
        <div>
            <p>Resultado final </p><asp:Label runat="server" ID="lblResultado"></asp:Label><br />
        </div>
    </form>
</body>
</html>