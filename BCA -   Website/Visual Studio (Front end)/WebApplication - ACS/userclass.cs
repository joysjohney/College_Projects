using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication2
{
    public class userclass:connection
    {
        public void register(string email, string pass)
        {
            SqlCommand cmd = new SqlCommand("insert into Table_user_reg (email,password) values (@email,@password)", sqlcon);
            cmd.Parameters.AddWithValue("@email", email);
            
            cmd.Parameters.AddWithValue("@password", pass);
            cmd.ExecuteNonQuery();
        }
        public DataTable check(string email)
        {
            SqlDataAdapter Adpt = new SqlDataAdapter();
            Adpt = new SqlDataAdapter("select email from Table_user_reg where email=@email", sqlcon);
            Adpt.SelectCommand.Parameters.AddWithValue("@email", email);

            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            return dt;
        }
        public DataTable login(string user, string password)
        {
            SqlDataAdapter Adpt = new SqlDataAdapter();
            Adpt = new SqlDataAdapter("select email from Table_user_reg where email=@user and  password=@password", sqlcon);
            Adpt.SelectCommand.Parameters.AddWithValue("@user", user);
            Adpt.SelectCommand.Parameters.AddWithValue("@password", password);
            DataTable dt = new DataTable();
            Adpt.Fill(dt);
            return dt;
        }
        public string findbook()
        {
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("select isnull(max(id)+1,10101) from Table_booking", sqlcon);
            string s = cmd.ExecuteScalar().ToString();
            return s;
        }
      
       
        public void booking(string id, string name, string dob, string proof, string email, string phone, string airname, string from, string to, string bookdate, string time, string price, string user)
        {
            SqlCommand cmd = new SqlCommand("insert into Table_booking(id,name,dob,idproof,email,phone,airname,depat,arrival,date,time,total,userid,status) values (@id,@name,@dob,@idproof,@email,@phone,@airname,@depat,@arrival,@date,@time,@total,@user,'Booked')", sqlcon);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@idproof", proof);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@airname", airname);
            cmd.Parameters.AddWithValue("@depat", from);
            cmd.Parameters.AddWithValue("@arrival", to);
            cmd.Parameters.AddWithValue("@date", bookdate);
            cmd.Parameters.AddWithValue("@time", time);
            cmd.Parameters.AddWithValue("@total", price);
            cmd.Parameters.AddWithValue("@user", user);

            cmd.ExecuteNonQuery();
        }



        public DataTable pj1()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='CTJ295'", sqlcon);
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

        public DataTable pj2()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='BCX250'", sqlcon);
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

        public DataTable pj3()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='CSN185'", sqlcon);
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
        public DataTable pj4()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='BHR830'", sqlcon);
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
        public DataTable pj5()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='CTN374'", sqlcon);
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
        public DataTable pj6()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='PGT381'", sqlcon);
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
        public DataTable pj7()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='ERN100'", sqlcon);
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
        public DataTable pj8()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='FCG637'", sqlcon);
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
        public DataTable pj9()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='ORY738'", sqlcon);
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

        public DataTable ej1()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='CUS473'", sqlcon);
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
        public DataTable ej2()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='KSK285'", sqlcon);
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
        public DataTable ej3()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='MCR503'", sqlcon);
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
        public DataTable ej4()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='RKL482'", sqlcon);
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
        public DataTable ej5()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='GTM396'", sqlcon);
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
        public DataTable ej6()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='LRT611'", sqlcon);
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
        public DataTable ej7()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='PTQ730'", sqlcon);
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
        public DataTable ej8()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='HKR406'", sqlcon);
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
        public DataTable ej9()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_aircraft where id='ELP295'", sqlcon);
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
        public DataTable hp1()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='BLD395'", sqlcon);
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
        public DataTable hp2()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='RBN743'", sqlcon);
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
        public DataTable hp3()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='NST639'", sqlcon);
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
        public DataTable hp4()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='AWN142'", sqlcon);
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
        public DataTable hp5()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='HFT836'", sqlcon);
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
        public DataTable hp6()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='NHD588'", sqlcon);
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
        public DataTable hp7()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='KRJ553'", sqlcon);
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
        public DataTable hp8()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='BRE727'", sqlcon);
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
        public DataTable hp9()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,price from Table_helicopter where id='UCT854'", sqlcon);
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
                   
      
        public DataTable getdep()
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,id from Table_airport ", sqlcon);
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
        public void statusupdate(string name)
        {
            SqlCommand cmd = new SqlCommand("update  Table_booking set status='paid' where userid=@name", sqlcon);
            cmd.Parameters.AddWithValue("@name", name);


            cmd.ExecuteNonQuery();
        }
        public void credit(string name, string cardno, string mm, string year, string total, string user)
        {
            SqlCommand cmd = new SqlCommand("insert into credit_pay (name,cardno,mm,year,total,username) values (@name,@cardno,@mm,@year,@total,@user)", sqlcon);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@cardno", cardno);
            cmd.Parameters.AddWithValue("@mm", mm);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@total", total);
            cmd.Parameters.AddWithValue("@user", user);
            cmd.ExecuteNonQuery();
        }
        public void debit(string name, string cardno, string mm, string year, string total, string user)
        {
            SqlCommand cmd = new SqlCommand("insert into debit_pay (name,cardno,mm,yy,total,username) values (@name,@cardno,@mm,@year,@total,@user)", sqlcon);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@cardno", cardno);
            cmd.Parameters.AddWithValue("@mm", mm);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@total", total);
            cmd.Parameters.AddWithValue("@user", user);
            cmd.ExecuteNonQuery();
        }
        //public DataTable getitem(string user)
        //{

        //    try
        //    {
        //        SqlDataAdapter Adpt = new SqlDataAdapter();
        //        Adpt = new SqlDataAdapter("select airname,depat,arrival,date,time from Table_booking where userid=@user", sqlcon);
        //        Adpt.SelectCommand.Parameters.AddWithValue("@user", user);
        //        DataTable dt = new DataTable();
        //        Adpt.Fill(dt);
        //        return dt;

        //    }
        //    catch (Exception ex)
        //    {
        //        DataTable dt = new DataTable();
        //        return dt;
        //        throw ex;
        //    }

        //}
        public DataTable getpassenger(string user)
        {

            try
            {
                SqlDataAdapter Adpt = new SqlDataAdapter();
                Adpt = new SqlDataAdapter("select name,dob,phone,email,idproof,id,total,airname,depat,arrival,date,time from Table_booking where id=@user", sqlcon);
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
        public void cancel(string id,string name)
        {
            SqlCommand cmd = new SqlCommand("update  Table_booking set status='cancel' where name=@name and id=@id", sqlcon);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
        }
    }
}