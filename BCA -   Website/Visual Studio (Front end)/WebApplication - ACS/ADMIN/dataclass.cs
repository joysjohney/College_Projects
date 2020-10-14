using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication2
{
    public class dataclass : connection
    {
        public void item_insert(string id, string name)
        {
            SqlCommand cmd = new SqlCommand("insert into Table_airport (id,name) values (@id,@name)", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);

            cmd.ExecuteNonQuery();
        }
        public void item_update(string id, string name)
        {
            SqlCommand cmd = new SqlCommand("update  Table_airport set name = @name where id = @id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
           
            cmd.ExecuteNonQuery();
        }
        public void item_delete(string id)
        {
            SqlCommand cmd = new SqlCommand("delete from  Table_airport  where id = @id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
        }
        public DataTable getitem()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_airport", sqlcon);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }

        public DataTable login(string user, string password)
        {
            SqlDataAdapter Adpt = new SqlDataAdapter();
            Adpt = new SqlDataAdapter("select email from Table_admin_reg where email=@email and  password=@password", sqlcon);
            Adpt.SelectCommand.Parameters.AddWithValue("@email", user);
            Adpt.SelectCommand.Parameters.AddWithValue("@password", password);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            return dt;
        }
        public void logininsert(string email, string user, string password)
        {
            SqlCommand cmd = new SqlCommand("insert into Table_admin_reg (email,username,password) values (@email,@user,@password)", sqlcon);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@user", user);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.ExecuteNonQuery();
        }

        public DataTable check(string user)
        {
            SqlDataAdapter Adpt = new SqlDataAdapter();
            Adpt = new SqlDataAdapter("select Username from Table_admin_reg where Username=@user", sqlcon);
            Adpt.SelectCommand.Parameters.AddWithValue("@user", user);

            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            return dt;
        }





        public DataTable craftitem()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_aircraft", sqlcon);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public void craft_insert(string id, string name, string seat, byte[] imgByte, string price)
        {
            SqlCommand cmd = new SqlCommand("insert into Table_aircraft (id,name,seat,image,price) values (@id,@name,@seat,@pict,@price)", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seat", seat);
            cmd.Parameters.AddWithValue("@price", price);
            if (imgByte != null)
            {
                cmd.Parameters.AddWithValue("@pict", imgByte);
            }
            else
            {
                cmd.Parameters.Add("@pict", SqlDbType.Image).Value = DBNull.Value;
            }
            cmd.ExecuteNonQuery();
        }





        public void craft_update(string id, string name, string seat, byte[] imgByte, string price)
        {
        //    SqlCommand cmd = new SqlCommand("update  Table_aircraft set name=@name,seat=@seat,image=@pict,price=@price where id = @id", sqlcon);
        //    cmd.Parameters.AddWithValue("@id", id);
        //    cmd.Parameters.AddWithValue("@name", name);
        //    cmd.Parameters.AddWithValue("@seat", seat);
        //    cmd.Parameters.AddWithValue("@price", price);
        //    if (imgByte != null)
        //    {
        //        cmd.Parameters.AddWithValue("@pict", imgByte);
        //    }
        //    else
        //    {
        //        cmd.Parameters.Add("@pict", SqlDbType.Image).Value = DBNull.Value;
        //    }
        //    cmd.ExecuteNonQuery();

        //    cmd.ExecuteNonQuery();
        //}         
            try
            {
                SqlCommand cmd = new SqlCommand();                                               
                if(imgByte !=null )
                {
                   cmd = new SqlCommand("update  Table_aircraft set name=@name,seat=@seat,image=@pict,price=@price where id = @id", sqlcon);                   
                   cmd.Parameters.AddWithValue("@pict", imgByte);
                   cmd.Parameters.AddWithValue("@id", id);
                   cmd.Parameters.AddWithValue("@name", name);
                   cmd.Parameters.AddWithValue("@seat", seat);
                   cmd.Parameters.AddWithValue("@price", price);
                }
                else
                {
                    cmd = new SqlCommand("update  Table_aircraft set name=@name,seat=@seat,price=@price where id = @id", sqlcon);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@seat", seat);
                    cmd.Parameters.AddWithValue("@price", price);
                 
                }
               
                cmd.ExecuteNonQuery();                                          
            }
          
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void craft_delete(string id)
        {
            SqlCommand cmd = new SqlCommand("delete from  Table_aircraft  where id = @id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();

        }









        public DataTable heliitem()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_helicopter", sqlcon);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public void heli_insert(string id, string name, string seat, byte[] imgByte, string price)
        {
            SqlCommand cmd = new SqlCommand("insert into Table_helicopter (id,name,seat,image,price) values (@id,@name,@seat,@pict,@price)", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seat", seat);
            cmd.Parameters.AddWithValue("@price", price);
            if (imgByte != null)
            {
                cmd.Parameters.AddWithValue("@pict", imgByte);
            }
            else
            {
                cmd.Parameters.Add("@pict", SqlDbType.Image).Value = DBNull.Value;
            }
            cmd.ExecuteNonQuery();

        }
        public byte[] APhoto(string id)
        {

            SqlCommand cmd = new SqlCommand("select image from Table_aircraft where id=@id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            byte[] p = null;
            if (dr.Read())
            {
                if (dr["image"] != DBNull.Value)
                {
                    p = (byte[])dr["image"];
                    dr.Close();
                    return p;
                }
            }
            dr.Close();
            return p;


        }


        public void heli_update(string id, string name, string seat, byte[] imgByte, string price)
        {
        //    SqlCommand cmd = new SqlCommand("update  Table_helicopter set name=@name,seat=@seat,image=@pict,price=@price where id = @id", sqlcon);
        //    cmd.Parameters.AddWithValue("@id", id);
        //    cmd.Parameters.AddWithValue("@name", name);
        //    cmd.Parameters.AddWithValue("@seat", seat);
        //    cmd.Parameters.AddWithValue("@price", price);
        //    if (imgByte != null)
        //    {
        //        cmd.Parameters.AddWithValue("@pict", imgByte);
        //    }
        //    else
        //    {
        //        cmd.Parameters.Add("@pict", SqlDbType.Image).Value = DBNull.Value;
        //    }
        //    cmd.ExecuteNonQuery();
        //}
         try
            {
                SqlCommand cmd = new SqlCommand();                                               
                if(imgByte !=null )
                {
            cmd = new SqlCommand("update  Table_helicopter set name=@name,seat=@seat,image=@pict,price=@price where id = @id", sqlcon);                  
            cmd.Parameters.AddWithValue("@pict", imgByte);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seat", seat);
            cmd.Parameters.AddWithValue("@price", price);
                }
                else
                {
            cmd = new SqlCommand("update  Table_helicopter set name=@name,seat=@seat,image=@pict,price=@price where id = @id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@seat", seat);
            cmd.Parameters.AddWithValue("@price", price);
                 
                }
               
                cmd.ExecuteNonQuery();                                          
            }
          
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void heli_delete(string id)
        {
            SqlCommand cmd = new SqlCommand("delete from  Table_helicopter  where id = @id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
        }
        public byte[] HPhoto(string id)
        {

            SqlCommand cmd = new SqlCommand("select image from Table_helicopter where id=@id", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            byte[] p = null;
            if (dr.Read())
            {
                if (dr["image"] != DBNull.Value)
                {
                    p = (byte[])dr["image"];
                    dr.Close();
                    return p;
                }
                else
                {
                    p = (byte[])dr["image"];
                    dr.Close();
                    return p;
                }
            }
            dr.Close();
            return p;


        }
        public DataTable getdate(string date)
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_booking where date=@date", sqlcon);
                Adpt.SelectCommand.Parameters.AddWithValue("@date", date);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public DataTable getcancel(string date)
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_booking where status=@date", sqlcon);
                Adpt.SelectCommand.Parameters.AddWithValue("@date", date);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public DataTable getpaid(string date)
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_booking where status=@date", sqlcon);
                Adpt.SelectCommand.Parameters.AddWithValue("@date", date);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public DataTable getreport()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_booking ", sqlcon);
               
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public DataTable gethistory(string user)
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_booking where userid=@user ", sqlcon);
                Adpt.SelectCommand.Parameters.AddWithValue("@user", user);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public DataTable getdepart(string depart)
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_booking where depat=@date", sqlcon);
                Adpt.SelectCommand.Parameters.AddWithValue("@date", depart);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
        public DataTable getairport()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select * from Table_airport", sqlcon);
                DataTable dt = new DataTable();
                Adpt.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                return dt;
                throw ex;
            }
        }
    }
}
