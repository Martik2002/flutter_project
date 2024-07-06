import 'package:cripto_coins_list/features/crypto_coin/view/view.dart';
import 'package:cripto_coins_list/repasitories/crypto_coins/model/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return ListTile(
         leading: Image.network(coin.imageUrl),
         title: Text(
           coin.name,
           style: theme.textTheme.bodyMedium,
         ),
         subtitle: Text(
           '${coin.price}',
           style: theme.textTheme.labelSmall,
         ),
         trailing: const Icon(Icons.arrow_forward_ios),
         onTap: () => {
       Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => CryptoCoinScrenn(coin: coin),
  ),
)
         },
       
     );
  }
}