package nl.waisda.model;
import nl.waisda.domain.User;
import nl.waisda.domain.UserScore;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import nl.waisda.model.Util;

import org.hibernate.annotations.Formula;
import org.jasypt.util.password.StrongPasswordEncryptor;

public class TopTags {
	
	private String name;
	private int totalTags;
	private int id;
	@Column(unique = true)
	private String email;
	private String imageUrl;
	public TopTags() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotalTags() {
		return totalTags;
	}

	public void setTotalTags(int totalTags) {
		this.totalTags = totalTags;
	}
	

		public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email.trim();
	}
		public String getAvatarUrl() {
		return getGravatarUrl(email, 150);
	}

	public String getSmallAvatarUrl() {
		return getGravatarUrl(email, 30);
	}

	public String getGravatarUrl(String email, int size) {
		return String.format(
				"http://www.gravatar.com/avatar/%s?s=%d&d=identicon",
				getGravatarHash(), size);
	}

	private String getGravatarHash() {
		String input = email;
		if (input != null) {
			input = input.trim().toLowerCase();
		}
		if (input == null || input.isEmpty()) {
			input = String.valueOf(id);
		}
		try {
			final String charset = "UTF-8";
			byte[] emailBytes = input.getBytes(charset);
			byte[] digest = MessageDigest.getInstance("MD5").digest(emailBytes);
			BigInteger bigInt = new BigInteger(1, digest);
			return bigInt.toString(16);
		} catch (UnsupportedEncodingException e) {
			return "";
		} catch (NoSuchAlgorithmException e) {
			return "";
		}
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
}
