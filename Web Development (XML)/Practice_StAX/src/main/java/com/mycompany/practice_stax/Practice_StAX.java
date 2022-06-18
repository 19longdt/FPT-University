/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.practice_stax;

/**
 *
 * @author 19longdt
 */
public class Practice_StAX {

    public static void main(String[] args) {
        System.out.println("Hello World!");
        
        StAXReader stAXReader = new StAXReader();
        System.out.println(stAXReader.getAllPersonals());
        
        StAXWrite stAXWrite = new StAXWrite();
        stAXWrite.writeFile(stAXReader.getAllPersonals());
    }
}
