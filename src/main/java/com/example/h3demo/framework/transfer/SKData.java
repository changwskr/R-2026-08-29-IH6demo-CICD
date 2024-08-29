package com.example.h3demo.framework.transfer;

import java.io.*;
import java.util.*;

import lombok.Data;

import java.net.*;
import java.rmi.*;
import java.io.Serializable;

@Data
public class SKData {


	private SKCommonCDTO cdto;
	private String x1;
	private String x2;

	/////////////////////////////////////////////////////////
	// IOBoundArea
	/////////////////////////////////////////////////////////

	public SKData() {
		this.cdto = new SKCommonCDTO();
		this.x1 = "test";
		this.x2 = "test";
	}
}