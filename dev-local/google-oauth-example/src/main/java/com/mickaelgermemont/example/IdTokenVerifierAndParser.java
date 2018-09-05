package com.mickaelgermemont.example;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;

public final class IdTokenVerifierAndParser {
    private final static String GOOGLE_CLIENT_ID = "346509154928-d0aocv11a5up021rkk6a6e796e3ar5h9.apps.googleusercontent.com";

    private IdTokenVerifierAndParser(){
      // if called by reflection
      throw new UnsupportedOperationException("class instantiation not supported");
    }

    public static String getClientId(){
      return GOOGLE_CLIENT_ID;
    }

    public static GoogleIdToken.Payload getPayload(final String tokenString) throws Exception {
        final JacksonFactory jacksonFactory = new JacksonFactory();
        final GoogleIdTokenVerifier googleIdTokenVerifier = new GoogleIdTokenVerifier(new NetHttpTransport(), jacksonFactory);

        final GoogleIdToken token = GoogleIdToken.parse(jacksonFactory, tokenString);

        if (googleIdTokenVerifier.verify(token)) {
            final GoogleIdToken.Payload payload = token.getPayload();
            if (!GOOGLE_CLIENT_ID.equals(payload.getAudience())) {
                throw new IllegalArgumentException("Audience mismatch");
            } else if (!GOOGLE_CLIENT_ID.equals(payload.getAuthorizedParty())) {
                throw new IllegalArgumentException("Client ID mismatch");
            }
            return payload;
        } else {
            throw new IllegalArgumentException("id token cannot be verified");
        }
    }
}
