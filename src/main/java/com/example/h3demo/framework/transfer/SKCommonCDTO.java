package com.example.h3demo.framework.transfer;


import lombok.Data;

@Data
public class SKCommonCDTO  {
  public String bankCode ="**";
  public String branchCode = "****";
  public String gIPostBrCode = "****";
  public String channelType = "**";
  public String userId = "**********";
  public String terminalId = "************";
  public String terminalType = "******";
  //EventNO
  public String eventNo = "*****";
  public String nationCode = "**";
  public String regionCode = "**";
  public String timeZone = "**";
  public String fxRateSeq = "**";
  public String xmlSeq = "**";

  //Deleagtion Layer
  public String reqName = "**********";
  public String trxDate = "********";
  public String bizDate = "********";
  public String trxInTime = "********";
  public String trxOutTime = "********";

  public String trxNumber = "****************";

  //GLG
  public String voucherNum = "****************";

  public String refNum = "****************";
  public String cifNum = "****************";

  public String baseCurrency = "***";
  public String atmSeqNo = "********************";

}
