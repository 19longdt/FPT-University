/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manage;

import entity.Student;
import java.util.List;

/**
 *
 * @author USE
 */
public class GradingMarkManager {

    public void calPercent(List<Student> list) {
        if (list.isEmpty()) {
            System.out.println("The is no student!");
        } else {
            System.out.println("Percentage grading");
            double countA = 0;
            double countB = 0;
            double countC = 0;
            double countD = 0;
            for (Student student : list) {
                if (student.getMark() > 7.5) {
                    countA++;
                } else if (student.getMark() >= 6 && student.getMark() <= 7.5) {
                    countB++;
                } else if (student.getMark() >= 4 && student.getMark() < 6) {
                    countC++;
                } else if (student.getMark() < 4 && student.getMark() >= 0) {
                    countD++;
                }
            }
            double a = (double) (countA / list.size() * 100.0);
            double b = (double) (countB / list.size() * 100.0);
            double c = (double) (countC / list.size() * 100.0);
            double d = (double) (countD / list.size() * 100.0);
            System.out.println("A: " + a + "%");
            System.out.println("B: " + b + "%");
            System.out.println("C: " + c + "%");
            System.out.println("D: " + d + "%");
        }
    }

    public boolean calcalPercentTest(List<Student> listTest) {
        int size = listTest.size();
        if (size == 0) {
            System.out.println("calcalPercentTest 1: ID does not exist");
            return false;
        }
        System.out.println("Percentage grading");
        double countA = 0;
        double countB = 0;
        double countC = 0;
        double countD = 0;
        for (Student student : listTest) {
            if (student.getMark() > 7.5) {
                countA++;
            } else if (student.getMark() >= 6 && student.getMark() <= 7.5) {
                countB++;
            } else if (student.getMark() >= 4 && student.getMark() < 6) {
                countC++;
            } else if (student.getMark() < 4 && student.getMark() >= 0) {
                countD++;
            }
        }
        double a = (double) (countA / listTest.size() * 100.0);
        double b = (double) (countB / listTest.size() * 100.0);
        double c = (double) (countC / listTest.size() * 100.0);
        double d = (double) (countD / listTest.size() * 100.0);
        System.out.println("A: " + a + "%");
        System.out.println("B: " + b + "%");
        System.out.println("C: " + c + "%");
        System.out.println("D: " + d + "%");
        return true;
    }
}
