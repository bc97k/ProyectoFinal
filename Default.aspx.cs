using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            if (txtCadena.Text.Length >= 16)
            {
                string entrada = CreditCard.Value + txtCadena.Text.Substring(txtCadena.Text.Length - 4, 4);
                //string entrada = txtCadena.Text.Replace("-", string.Empty);
                Regex regex = new Regex(@"^\d{16,16}$");
                //Valida que sea un número de tarjeta válido
                if (regex.IsMatch(entrada))
                {
                    using (AesManaged myAes = new AesManaged())
                    {
                        string key = BitConverter.ToString(myAes.Key);
                        // Encriptar en AES256.
                        byte[] encrypted = Controller.Encriptar.EncryptStringToBytes_Aes(entrada, myAes.Key, myAes.IV);

                        // desencriptar en AES256.
                        string roundtrip = Controller.Encriptar.DecryptStringFromBytes_Aes(encrypted, myAes.Key, myAes.IV);

                        //Mostrando los resultados
                        lblNormal.Text = txtCadena.Text;
                        //LE aplica el algoritmo SHA512 a la cadena de entrada
                        string sSha = BitConverter.ToString(Controller.Encriptar.HmacSha256Digest(entrada, ConfigurationManager.AppSettings["LaKey"])).Replace("-", "").ToLower();
                        lblSHA.Text = sSha;
                        //LE aplica el algoritmo SHA512 a la cadena que previsamente se le aplicó AES256
                        string sAES = BitConverter.ToString(Controller.Encriptar.HmacSha256Digest(roundtrip, ConfigurationManager.AppSettings["LaKey"])).Replace("-", "").ToLower();
                        lblAES.Text = sAES;
                        //Realiza la comparación de resultados
                        lblResultado.Text = (sSha.Equals(sAES) ? "Iguales" : "Algo falló, no son iguales :(");
                    }
                }
                else
                {
                    txtCadena.Text = string.Empty;
                    CreditCard.Value = string.Empty;
                    //Mensaje si la tarjeta ingresada tiene un formato incorrecto
                    ClientScript.RegisterClientScriptBlock(Page.GetType(), "AlertMsg", "<script language='javascript'>alert('Número de tarjeta incorrecto');</script>");
                }
            }
            else
            {
                txtCadena.Text = string.Empty;
                CreditCard.Value = string.Empty;
                //Mensaje si la tarjeta ingresada tiene un formato incorrecto
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "AlertMsg", "<script language='javascript'>alert('Número de tarjeta incorrecto');</script>");
            }

        }
    }
}