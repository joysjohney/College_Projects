package com.mtlz.qetc;

import okhttp3.MultipartBody;
import retrofit2.Call;
import retrofit2.http.Multipart;
import retrofit2.http.POST;
import retrofit2.http.Part;
import retrofit2.http.Query;

public interface ApiConfig {

    @Multipart
    @POST("upload.php")
    Call<ServerResponse> uploadMulFile(@Part MultipartBody.Part file1,
                                       @Part MultipartBody.Part file2,
                                       @Query("email") String email,
                                       @Query("reg_no") String reg_no,
                                       @Query("owner_name") String owner_name,
                                       @Query("chasis_no") String chasis_no,
                                       @Query("type") String type
    );

}
