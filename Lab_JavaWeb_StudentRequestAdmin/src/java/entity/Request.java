/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author hp
 */
public class Request {

    private int id, requestToDid;
    private String requestName, studentId, studentName, dateCreated, title, content;
    private int status;
    private String closeDate, attachFile, solution;
    private int count;

    public Request() {
    }

    public Request(int requestToDid, String requestName, int count) {
        this.requestName = requestName;
        this.requestToDid = requestToDid;
        this.count = count;
    }

    public Request(int id, String requestName, String dateCreated, String title, int status, String closeDate) {
        this.id = id;
        this.requestName = requestName;
        this.dateCreated = dateCreated;
        this.title = title;
        this.status = status;
        this.closeDate = closeDate;
    }

    public Request(int id, int requestToDid, String requestName, String studentId, String studentName, String dateCreated, String title, String content, int status, String closeDate, String attachFile, String solution, int count) {
        this.id = id;
        this.requestToDid = requestToDid;
        this.requestName = requestName;
        this.studentId = studentId;
        this.studentName = studentName;
        this.dateCreated = dateCreated;
        this.title = title;
        this.content = content;
        this.status = status;
        this.closeDate = closeDate;
        this.attachFile = attachFile;
        this.solution = solution;
        this.count = count;
    }

    public Request(int id, int requestToDid, String requestName, String studentId, String studentName, String dateCreated, String title, String content, int status, String closeDate, String attachFile, String solution) {
        this.id = id;
        this.requestToDid = requestToDid;
        this.requestName = requestName;
        this.studentId = studentId;
        this.studentName = studentName;
        this.dateCreated = dateCreated;
        this.title = title;
        this.content = content;
        this.status = status;
        this.closeDate = closeDate;
        this.attachFile = attachFile;
        this.solution = solution;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRequestToDid() {
        return requestToDid;
    }

    public void setRequestToDid(int requestToDid) {
        this.requestToDid = requestToDid;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(String closeDate) {
        this.closeDate = closeDate;
    }

    public String getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(String attachFile) {
        this.attachFile = attachFile;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

}
