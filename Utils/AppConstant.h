//
//  AppConstant.h
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#ifndef AppConstant_h
#define AppConstant_h

#define loginKeyTOKEN @"loginKeyTOKEN"
#define loginKeyUSERNAME @"loginKeyUSERNAME"
#define loginKeyPASSWORD @"loginKeyPASSWORD"
#define loginKeyUSERID @"loginKeyUSERID"
#define loginKeyIPADDRESS @"loginKeyIPADDRESS"
#define domainURL @"domainURL"


#define langCodeVietnam 1
#define langCodeEnglish 0
#define langCodeThailan 2
#define langCodeChinese 3
#define langCodeFrench 4
#define langCodeRussia 5


#define baseURL @"http://rrm.fcv-etools.com/fcv-rl-web"
#define loginPath @"/mobile/retailer/auth.html"


/* Global variable, method */
extern id UDValue4Key(NSString *key);
extern void UDSetValue4Key(id value, NSString *key);

#endif /* AppConstant_h */
