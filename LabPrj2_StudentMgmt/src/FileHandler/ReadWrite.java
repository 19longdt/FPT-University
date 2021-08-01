/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileHandler;

import entity.Student;
import entity.User;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class ReadWrite {

    public  void writeFileUser(List<User> update) {
        ObjectOutputStream outStream = null;
        try {
            try (FileOutputStream fileO = new FileOutputStream("User.dat")) {
                outStream = new ObjectOutputStream(fileO);
                outStream.writeObject(update);
            }
        } catch (IOException e) {
            System.out.println("Error file");
        } finally {
            try {
                if (outStream != null) {
                    outStream.close();
                }
            } catch (IOException ex) {
                Logger.getLogger(ReadWrite.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static ArrayList<User> readFileUser() {
        ArrayList<User> update = new ArrayList<>();
        ObjectInputStream inStream = null;
        try {
            try (FileInputStream f = new FileInputStream("User.dat")) {
                inStream = new ObjectInputStream(f);
                update = (ArrayList<User>) inStream.readObject();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found");
        } catch (IOException e) {
            return update;

        }
        return update;
    }

    public static void writeFileStudent(List<Student> update) {
        ObjectOutputStream outStream = null;
        try {
            try (FileOutputStream fileO = new FileOutputStream("Student.dat")) {
                outStream = new ObjectOutputStream(fileO);
                outStream.writeObject(update);
            }
        } catch (IOException e) {
            System.err.println("Error file");
        } finally {
            try {
                if (outStream != null) {
                    outStream.close();
                }
            } catch (IOException ex) {
                Logger.getLogger(ReadWrite.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static ArrayList<Student> readFileStudent() {
        ArrayList<Student> update = new ArrayList<>();
        try {
            FileInputStream f = new FileInputStream("Student.dat");
            try (ObjectInputStream inStream = new ObjectInputStream(f)) {
                update = (ArrayList<Student>) inStream.readObject();
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Class not found");
        } catch (IOException e) {
            return update;
        }
        return update;
    }

}
