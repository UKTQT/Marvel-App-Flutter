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

    static String md5Hash = md5.convert(utf8.encode(timeStamp + privateKey + publicKey)).toString();
  }

```

</br>

## Project Screenshots

<table>

  <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/169696434-011f7ee4-6ee5-40b4-ac7e-42e05bac98cb.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/169696448-69f93249-4c62-477c-8fc9-ebce4c8a9f0c.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/169696501-9972d983-e7a5-4efb-82ba-a0bec84027ff.jpg" width="350" title="hover text"></td>
  </tr>
  <tr>
     <td><img src="https://user-images.githubusercontent.com/17275354/169696463-9571a225-be4f-485b-b5a1-4c5bda7bf13d.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/169696522-ad5ecfa8-a5a5-4c95-a587-b98c5a70f99f.jpg" width="350" title="hover text"></td>
    <td><img src="https://user-images.githubusercontent.com/17275354/169696531-0a9d37eb-1640-41dd-a0aa-9132eb096cc1.jpg" width="350" title="hover text"></td>
     <td><img src="https://user-images.githubusercontent.com/17275354/169696536-6ff7245b-d833-4a13-bc2d-1dbb3ccc04f9.jpg" width="350" title="hover text"></td>
  </tr>
</table>
