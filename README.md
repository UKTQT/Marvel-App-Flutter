# Custom Marvel App - Dart / Flutter


## Project Status ( Continues - Devam Ediyor)

<table>
  <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/169695742-ab0664fc-28a6-42f9-8d2f-a342aef5a62c.gif" alt="Suspended" width="300"></td>
  </tr> 
</table>

</br>

## Project Description

### Tr
Custom Marvel App projesi, <a href="https://www.marvel.com"> Marvel Entertainment </a> şirketinin https://developer.marvel.com adresinden açtığı API kullanılarak kodlanmış bir projedir. Ticari amacı yoktur. İçeriğinde  Flutter Mobx, Provider, Dio, Cached_Network_Image, Crypto, Intl paketleri kullanılmıştır. 
</br>
### En
The Custom Marvel App project is a project coded using the API opened by the <a href="https://www.marvel.com"> Marvel Entertainment </a> company at https://developer.marvel.com. It has no commercial purpose. Flutter Mobx, Provider, Dio, Cached_Network_Image, Crypto, Intl packages are used in its content.




</br>

## Project Feature

#### Responsive Screen ✓
#### Clean Code ✓


</br>

## Project Package

#### mobx
#### provider
#### dio
#### cached_network_image
#### crypto
#### intl


</br>

## Using


#### Use package as a library
```js
   $ flutter packages get
```

#### Add tokens from Marvel to your code:
```js
  class Config {
  static const publicKey = 'YOUR_PUBLIC_KEY';
  static const privateKey = 'YOUR_PRIVATE_KEY';
  static dynamic timeStamp = 1.toString();

  static String md5Hash =
      md5.convert(utf8.encode(timeStamp + privateKey + publicKey)).toString();
}

```

</br>

## Project Screenshots

<table>

  <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/161054793-b19c1c94-02d5-402c-9827-8ea27f748af7.gif" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161054908-681ee218-8cbe-49d4-bf25-3591575708a5.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161054955-120ecdbf-ad6b-43c8-8100-1d2d346c72ac.jpg" width="350" title="hover text"></td>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055015-42432b81-db70-4acd-a5e6-2c1f669e4e67.jpg" width="350" title="hover text"></td>
  </tr>
  <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055183-f27d1084-ff17-4c9b-8f97-bed30836b477.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161055200-dc63730c-726f-4a7a-bef5-669afd8a6a61.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161055224-29336d49-7b66-4c8d-b7d3-035c32658a87.jpg" width="350" title="hover text"></td>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055234-77560f2f-2097-4931-9859-e306b6647c4f.jpg" width="350" title="hover text"></td>
  </tr>
   <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055263-bae82b5e-6932-445b-825a-3b5c7f15f852.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161055291-3a7548b5-b742-4d6b-acb1-1aacdb03758c.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161055309-b7afa8a4-873e-4e8e-86c3-94faafb537f3.jpg" width="350" title="hover text"></td>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055339-996696db-8db4-4673-a0c5-cadbe01b1a94.jpg" width="350" title="hover text"></td>
  </tr>
   <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055580-d4cf7e3b-68cf-4531-87b8-c7b82e9de383.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161055601-91ff76dd-d162-43a9-b738-52fdcacbae2c.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/161055617-8b176756-a117-45fe-b1b7-0a99438bfe24.jpg" width="350" title="hover text"></td>
     <td><img src="https://user-images.githubusercontent.com/17275354/161055670-0b965569-5d4d-459d-becd-378b36c89388.gif" width="350" title="hover text"></td>
  </tr>
  
  
</table>
