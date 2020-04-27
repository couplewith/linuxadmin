
php curl : http://ticket.interpark.com/ClassicIndex.asp
<?php


$get_url="http://ticket.interpark.com/ClassicIndex.asp";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $get_url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
curl_exec($ch);


?>