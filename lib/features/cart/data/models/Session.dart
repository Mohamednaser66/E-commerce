/// url : "https://checkout.stripe.com/c/pay/cs_test_a1EdnmfpTEWeyHhMIlExwB7trEJokCewAHD7cZggpKWZDPUBRk0dHu0Z8R#fidnandhYHdWcXxpYCc%2FJ2FgY2RwaXEnKSdkdWxOYHwnPyd1blpxYHZxWjA0SHViYl1ANVYyU2pOX2hVVW9ASmZBUElpa2FLVnBUQGo2UFduUEhIXHx9aEhjanBGZ1NxZ3RKNVVtXWxcSTJ8Qzx2aWZkUEBpMXJCXVRHTkIxZzBSZmhENTUxYHVKMUpQVycpJ2N3amhWYHdzYHcnP3F3cGApJ2dkZm5id2pwa2FGamlqdyc%2FJyZjY2NjY2MnKSdpZHxqcHFRfHVgJz8ndmxrYmlgWmxxYGgnKSdga2RnaWBVaWRmYG1qaWFgd3YnP3F3cGB4JSUl"
/// success_url : "http://localhost:3000/allorders"
/// cancel_url : "http://localhost:3000/cart"

class Session {
  Session({
      this.url, 
      this.successUrl, 
      this.cancelUrl,});

  Session.fromJson(dynamic json) {
    url = json['url'];
    successUrl = json['success_url'];
    cancelUrl = json['cancel_url'];
  }
  String? url;
  String? successUrl;
  String? cancelUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['success_url'] = successUrl;
    map['cancel_url'] = cancelUrl;
    return map;
  }

}