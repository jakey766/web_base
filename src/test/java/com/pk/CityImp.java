package com.pk;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by jiangkunpeng on 16/10/30.
 */
public class CityImp {

    public static void main(String[] args){
        InputStream is = null;
        BufferedReader br = null;
        Connection conn = null;
        int cid = 149;
        int idx = 1;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/byd_cm?characterEncoding=utf8", "root", "root");
            is = CityImp.class.getResourceAsStream("/cities");
            br = new BufferedReader(new InputStreamReader(is));
            String line = null;
            while((line=br.readLine())!=null){
                line = line.trim();
                String[] splits = line.split("：");
                if(splits.length==2){
                    int pid = ++cid;
                    String prov = splits[0].trim();

                    addCity(conn, 0, pid, 1, prov);

                    String[] cities = splits[1].trim().split(" ");
                    System.out.println(prov);
                    for(String city: cities){
                        city = city.trim();
                        if(city.length()<1)
                            continue;

                        addCity(conn, pid, ++cid, 2, city);

                        System.out.print(city+" , ");
                    }
                    System.out.println();
                }
            }
            System.out.println("ok");
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(is!=null)
                    is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void addCity(Connection conn, int pid, int cid, int level, String name) throws Exception{
        PreparedStatement stmt = null;
        String code = null;
        if(level==1)
            code = "," + cid + ",";
        else
            code = "," + pid + "," + cid + ",";
        stmt = conn.prepareStatement("insert into sys_tree (id, `type`, level, pid, name, code) values(?, ?, ?, ?, ?, ?)");
        int idx = 1;
        stmt.setInt(idx++, cid);
        stmt.setString(idx++, "CITY");
        stmt.setInt(idx++, level);
        stmt.setInt(idx++, pid);
        stmt.setString(idx++, name);
        stmt.setString(idx++, code);
        stmt.executeUpdate();

        stmt.close();
    }

}
