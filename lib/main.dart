import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WhatsApp UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Row(
          children: [
            // Painel esquerdo com abas
            Container(
              width: 250,
              color: Colors.grey[200],
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      Tab(icon: Icon(Icons.person), text: 'Contatos'),
                      Tab(icon: Icon(Icons.message), text: 'Mensagens'),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        ContactsTab(),
                        MessagesTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Área principal de chat
            const Expanded(
              child: ChatWindow(),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text('Contato ${index + 1}'),
      ),
    );
  }
}

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.chat_bubble)),
        title: Text('Conversa ${index + 1}'),
        subtitle: const Text('Última mensagem...'),
      ),
    );
  }
}

class ChatWindow extends StatelessWidget {
  const ChatWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.green[100],
          width: double.infinity,
          child: const Text(
            'Nome do Contato',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Center(child: Text('Área de mensagens...')),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey[100],
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Digite uma mensagem...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.green),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
