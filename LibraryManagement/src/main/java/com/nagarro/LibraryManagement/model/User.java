package com.nagarro.LibraryManagement.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	@Id
	private int id;
	private String username;
	private String bookname;
	private String authorname;
	private String password;
	private String date;
	public User() {
		
	}
	
	public User(String username, String bookname, String authorname, String password, String date) {
		super();
		this.username = username;
		this.bookname = bookname;
		this.authorname = authorname;
		this.password = password;
		this.date = date;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", bookname=" + bookname + ", authorname=" + authorname
				+ ", password=" + password + ", date=" + date + "]";
	}
	
	
}
