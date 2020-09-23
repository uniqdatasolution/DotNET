using Shopping.Portal.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Shopping.Portal.Data.Helpers
{
    public static class MasterHelperService
    {
        public static object EncodePasswordToBase64(string password)
        {
            try
            {
                if(password == null)
                {
                    return string.Empty;
                }
                byte[] encData_byte = new byte[password.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
                object encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        }

        public static string DecodeFrom64(string encodedData)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encodedData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new String(decoded_char);
            return result;
        }

        public static DataSet SqlConnectionSPHelper(string spName, List<Tuple<string, object>> parameter)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = con;
                if (parameter != null && parameter.Count >= 1)
                {
                    foreach (Tuple<string, object> tuple in parameter)
                    {
                        cmd.Parameters.AddWithValue(tuple.Item1, tuple.Item2);
                    }
                }
                try
                {
                    con.Open();
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    return ds;
                }
                catch (Exception ex)
                {
                    throw;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        public static Tuple<bool, int> ValidatingUserForAll(LoginMaster loginUser, object cases)

        {
            try
            {
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@UserName",loginUser.UserName),
                        Tuple.Create("@Password",EncodePasswordToBase64(Convert.ToString(loginUser.Password))),
                        Tuple.Create("@CASES",cases)
                 };
                DataSet executedSP = SqlConnectionSPHelper("ValidateUser", parameterList);
                bool isExist = false; int id = default(int);
                for (int i = 0; i < executedSP.Tables[0].Rows.Count; i++)
                {
                    isExist = Convert.ToBoolean(executedSP.Tables[0].Rows[i]["IsExist"]);
                    id = Convert.ToInt32(executedSP.Tables[0].Rows[i]["Id"]);
                }
                return new Tuple<bool, int>(isExist, id);
            }
            catch (Exception ex)
            {
                return new Tuple<bool, int>(false, default(int));
            }
        }

        public static void CloseConnection(SqlConnection con)
        {
            con.Close();
        }
    }
}
